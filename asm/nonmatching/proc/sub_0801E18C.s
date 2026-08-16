	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E18C
sub_0801E18C: @ 0x0801E18C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov sb, r0
	ldr r0, _0801E228 @ =gUnknown_0200F720
	mov r1, sb
	lsls r4, r1, #4
	adds r4, r4, r0
	movs r2, #4
	ldrsh r0, [r4, r2]
	bl sub_0801BAA8
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl __divsi3
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #4
	ldrsh r0, [r4, r1]
	bl sub_0801BA4C
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	rsbs r0, r0, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #4
	ldrsh r0, [r4, r1]
	bl sub_0801BA4C
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #4
	ldrsh r0, [r4, r1]
	bl sub_0801BAA8
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_0801E108
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E228: .4byte gUnknown_0200F720

