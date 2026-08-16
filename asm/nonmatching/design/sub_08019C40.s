	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019C40
sub_08019C40: @ 0x08019C40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r2, _08019CF0 @ =gUnknown_03001FF8
	ldr r1, _08019CF4 @ =gUnknown_03001418
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1]
	strh r0, [r2]
	bl sub_08019C24
	movs r1, #0
	adds r0, r7, #0
	adds r0, #0x41
	ldr r2, _08019CF8 @ =gUnknown_0808E5BC
	mov r8, r2
	ldrb r0, [r0]
	cmp r1, r0
	bge _08019CD2
_08019C6A:
	lsls r6, r1, #0x10
	asrs r6, r6, #0x10
	adds r0, r7, #0
	adds r0, #0x31
	adds r0, r0, r6
	ldrb r4, [r0]
	adds r0, r7, #0
	adds r0, #0x24
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r5, #2
	ands r5, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	rsbs r5, r5, #0
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #1
	lsls r2, r6, #1
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	ldr r2, [r3]
	ldr r2, [r2]
	ldr r3, [r7, #0x20]
	lsls r4, r4, #5
	adds r4, r4, r3
	ldrh r3, [r4, #0x1c]
	movs r4, #0x80
	lsls r4, r4, #8
	str r4, [sp]
	lsrs r5, r5, #0x1f
	str r5, [sp, #4]
	bl sub_08014A5C
	adds r6, #1
	lsls r6, r6, #0x10
	lsrs r1, r6, #0x10
	asrs r6, r6, #0x10
	adds r0, r7, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r6, r0
	blt _08019C6A
_08019CD2:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldr r1, _08019CFC @ =0x06007000
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011E54
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019CF0: .4byte gUnknown_03001FF8
_08019CF4: .4byte gUnknown_03001418
_08019CF8: .4byte gUnknown_0808E5BC
_08019CFC: .4byte 0x06007000

