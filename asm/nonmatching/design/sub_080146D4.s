	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080146D4
sub_080146D4: @ 0x080146D4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	mov sb, r2
	ldr r2, [sp, #0x24]
	ldr r4, [sp, #0x28]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08014734 @ =gUnknown_0200C020
	mov r8, r0
	ldr r1, _08014738 @ =gUnknown_03002514
	movs r0, #0
	strb r0, [r1]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r3, [sp]
	str r2, [sp, #4]
	str r4, [sp, #8]
	mov r0, r8
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, sb
	bl sub_080147B4
	mov r0, r8
	bl sub_08014074
	ldr r0, _0801473C @ =gUnknown_08489568
	movs r1, #0
	bl sub_080152EC
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014734: .4byte gUnknown_0200C020
_08014738: .4byte gUnknown_03002514
_0801473C: .4byte gUnknown_08489568

