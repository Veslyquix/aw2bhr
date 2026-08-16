	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A8F0
sub_0803A8F0: @ 0x0803A8F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_08024268
	ldr r0, _0803A940 @ =gUnknown_03001418
	movs r5, #0
	strh r5, [r0]
	ldr r0, _0803A944 @ =gUnknown_03001FF8
	strh r5, [r0]
	ldr r0, _0803A948 @ =gUnknown_0849E2C8
	movs r1, #0
	bl sub_080152EC
	ldr r0, _0803A94C @ =gUnknown_0849E240
	movs r1, #0
	bl sub_080152EC
	ldrb r2, [r4, #2]
	ldr r1, _0803A950 @ =gUnknown_08090F84
	ldr r0, [r1]
	ldr r0, [r0]
	movs r3, #4
	ldrsh r0, [r0, r3]
	adds r6, r1, #0
	cmp r0, #0
	bge _0803A926
	adds r0, #0xf
_0803A926:
	asrs r0, r0, #4
	subs r0, r2, r0
	cmp r0, #6
	bgt _0803A958
	ldr r3, _0803A954 @ =gUnknown_08090F88
	ldr r2, [r3]
	ldr r1, [r2]
	movs r0, #0x80
	strb r0, [r1]
	ldr r0, [r2]
	strb r5, [r0, #2]
	adds r2, r3, #0
	b _0803A966
	.align 2, 0
_0803A940: .4byte gUnknown_03001418
_0803A944: .4byte gUnknown_03001FF8
_0803A948: .4byte gUnknown_0849E2C8
_0803A94C: .4byte gUnknown_0849E240
_0803A950: .4byte gUnknown_08090F84
_0803A954: .4byte gUnknown_08090F88
_0803A958:
	ldr r2, _0803A988 @ =gUnknown_08090F88
	ldr r1, [r2]
	ldr r0, [r1]
	strb r5, [r0]
	ldr r1, [r1]
	movs r0, #0xe
	strb r0, [r1, #2]
_0803A966:
	ldrb r1, [r4, #3]
	ldr r0, [r6]
	ldr r0, [r0]
	movs r3, #6
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0803A976
	adds r0, #0xf
_0803A976:
	asrs r0, r0, #4
	subs r0, r1, r0
	cmp r0, #4
	bgt _0803A98C
	ldr r0, [r2]
	ldr r1, [r0]
	movs r0, #0xa
	b _0803A992
	.align 2, 0
_0803A988: .4byte gUnknown_08090F88
_0803A98C:
	ldr r0, [r2]
	ldr r1, [r0]
	movs r0, #0
_0803A992:
	strb r0, [r1, #3]
	ldr r0, [r2]
	ldr r2, [r0]
	str r4, [r2, #4]
	ldr r0, _0803A9C4 @ =gUnknown_08499594
	ldr r1, [r0]
	subs r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	strb r0, [r2, #8]
	movs r0, #0x65
	bl sub_0803B4DC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A9C4: .4byte gUnknown_08499594

