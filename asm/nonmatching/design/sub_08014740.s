	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014740
sub_08014740: @ 0x08014740
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	mov sb, r2
	adds r6, r3, #0
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r1, _080147AC @ =gUnknown_03002514
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080147B0 @ =gUnknown_08489530
	movs r1, #0
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl sub_080152EC
	mov r8, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r6, [sp]
	ldr r2, [sp, #0xc]
	str r2, [sp, #4]
	ldr r3, [sp, #0x10]
	str r3, [sp, #8]
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, sb
	bl sub_080147B4
	mov r0, r8
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080147AC: .4byte gUnknown_03002514
_080147B0: .4byte gUnknown_08489530

