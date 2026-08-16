	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080859A0
sub_080859A0: @ 0x080859A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r3, #0
	ldr r1, [sp, #0x18]
	ldr r7, [sp, #0x1c]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	bl sub_080261A4
	lsls r4, r4, #0xc
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	orrs r4, r0
	ldr r3, _080859DC @ =gUnknown_0848B690
	str r4, [sp]
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0801BEBC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080859DC: .4byte gUnknown_0848B690

