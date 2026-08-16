	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080149C0
sub_080149C0: @ 0x080149C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov sb, r2
	mov r8, r3
	ldr r4, [sp, #0x20]
	ldr r0, [sp, #0x24]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	movs r0, #0
	bl sub_08015BD0
	lsls r0, r0, #0x18
	ldr r2, _08014A3C @ =gUnknown_03001470
	asrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r7, r1, r2
	mov r0, r8
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x24]
	mov r1, sb
	str r1, [r7, #0x28]
	strh r4, [r7, #0x2c]
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	adds r0, #0x30
	strb r5, [r0]
	adds r0, #2
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
_08014A1A:
	adds r0, r7, #0
	bl sub_08013D4C
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_08014084
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08014A40
	cmp r0, #1
	bgt _08014A1A
	cmp r0, #0
	beq _08014A4C
	b _08014A1A
	.align 2, 0
_08014A3C: .4byte gUnknown_03001470
_08014A40:
	adds r0, r7, #0
	adds r1, r4, #0
	mov r2, sl
	bl sub_0801B998
	b _08014A1A
_08014A4C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

