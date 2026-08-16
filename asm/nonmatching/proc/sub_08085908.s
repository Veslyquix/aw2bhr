	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085908
sub_08085908: @ 0x08085908
	push {r4, r5, r6, lr}
	ldr r1, _08085940 @ =gUnknown_030030A0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08085944 @ =gUnknown_0823DF48
	ldr r4, _08085948 @ =gUnknown_08499580
	ldr r1, [r4]
	bl Decompress
	movs r2, #0
	ldr r5, _0808594C @ =0x000003FF
	movs r0, #0xd8
	lsls r0, r0, #2
	adds r3, r0, #0
_08085924:
	ldr r0, [r4]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r3, r6
	strh r0, [r1]
	adds r2, #1
	cmp r2, r5
	ble _08085924
	bl sub_08013B0C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085940: .4byte gUnknown_030030A0
_08085944: .4byte gUnknown_0823DF48
_08085948: .4byte gUnknown_08499580
_0808594C: .4byte 0x000003FF

