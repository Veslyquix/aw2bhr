	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C01C
sub_0801C01C: @ 0x0801C01C
	sub sp, #4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	mov sl, r2
	str r3, [sp, #0x20]
	ldr r0, [sp, #0x28]
	lsls r1, r5, #0x10
	ldr r2, _0801C08C @ =0xFFFF0000
	adds r5, r3, #0
	ands r5, r2
	movs r6, #0
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r5, r3, #0
	orrs r5, r2
	lsls r5, r5, #0x10
	ldr r2, [sp, #0x20]
	lsls r2, r2, #0x10
	mov sb, r2
	ldr r4, [sp, #0x24]
	adds r3, r4, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r2, r8
	lsls r2, r2, #0x17
	lsrs r2, r2, #7
	orrs r2, r5
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	mov r1, sb
	orrs r2, r1
	lsrs r2, r2, #0x10
	str r3, [sp]
	mov r1, r8
	mov r3, sl
	bl sub_0801BEFC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r3}
	add sp, #4
	bx r3
	.align 2, 0
_0801C08C: .4byte 0xFFFF0000

