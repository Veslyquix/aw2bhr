	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037B90
sub_08037B90: @ 0x08037B90
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r3, #0
	ldr r5, _08037C28 @ =gUnknown_0849957C
	movs r4, #0
	ldr r2, _08037C2C @ =0x000003FF
_08037BA0:
	ldr r0, [r5]
	lsls r1, r3, #1
	adds r1, r1, r0
	strh r4, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r2
	bls _08037BA0
	ldr r0, _08037C30 @ =gUnknown_03003F68
	ldr r0, [r0]
	ldrb r1, [r0]
	ldrb r2, [r0, #1]
	cmp r1, #0x20
	bls _08037BC0
	movs r1, #0x20
_08037BC0:
	cmp r2, #0x20
	bls _08037BC6
	movs r2, #0x20
_08037BC6:
	movs r3, #0
	adds r0, r1, #1
	asrs r1, r0, #1
	cmp r3, r1
	bge _08037C18
	adds r2, #1
	mov ip, r2
	asrs r0, r2, #1
	lsls r0, r0, #4
	mov sb, r0
	mov r8, r1
_08037BDC:
	movs r2, #0
	adds r5, r3, #1
	cmp r2, sb
	bge _08037C10
	ldr r7, _08037C28 @ =gUnknown_0849957C
	movs r0, #0x80
	lsls r0, r0, #5
	adds r6, r0, #0
	mov r1, ip
	asrs r0, r1, #1
	lsls r4, r0, #4
_08037BF2:
	lsls r1, r2, #1
	adds r1, r1, r3
	ldr r0, [r7]
	lsls r1, r1, #1
	adds r1, r1, r0
	adds r0, r2, #1
	adds r0, r3, r0
	adds r0, r0, r6
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r4
	blt _08037BF2
_08037C10:
	lsls r0, r5, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt _08037BDC
_08037C18:
	bl sub_08013AFC
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037C28: .4byte gUnknown_0849957C
_08037C2C: .4byte 0x000003FF
_08037C30: .4byte gUnknown_03003F68

