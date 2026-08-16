	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B2BC
sub_0803B2BC: @ 0x0803B2BC
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _0803B32C @ =gUnknown_0849E700
	ldr r2, _0803B330 @ =gUnknown_0849E6F8
	movs r1, #0
	str r1, [sp]
	movs r3, #0
	bl sub_08015438
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	add r0, sp, #4
	adds r1, r4, #0
	bl sub_08015638
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r0, _0803B334 @ =0xFFFF0FFF
	ands r0, r2
	movs r3, #0x80
	lsls r3, r3, #7
	orrs r0, r3
	ldr r3, _0803B338 @ =0xFFFFFC00
	ands r0, r3
	movs r3, #0x74
	adds r2, r0, #0
	orrs r2, r3
	adds r0, r4, #0
	bl sub_08015608
	adds r0, r4, #0
	movs r1, #0xaa
	movs r2, #0x20
	bl sub_080155C0
	adds r0, r4, #0
	bl sub_08016824
	adds r0, r4, #0
	bl sub_08016944
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080157A4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080157F4
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803B32C: .4byte gUnknown_0849E700
_0803B330: .4byte gUnknown_0849E6F8
_0803B334: .4byte 0xFFFF0FFF
_0803B338: .4byte 0xFFFFFC00

