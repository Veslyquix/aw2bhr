	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802150C
sub_0802150C: @ 0x0802150C
	push {r4, r5, lr}
	ldr r0, _08021564 @ =gUnknown_030033E4
	movs r5, #0
	movs r4, #0
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, _08021568 @ =gUnknown_030033E0
	strh r4, [r0]
	strh r4, [r0, #2]
	bl sub_0802BB98
	ldr r0, _0802156C @ =gUnknown_030040F0
	str r4, [r0]
	ldr r0, _08021570 @ =gUnknown_030044A0
	str r4, [r0]
	bl sub_08034FA4
	ldr r0, _08021574 @ =gUnknown_030040E4
	strh r4, [r0]
	ldr r0, _08021578 @ =gUnknown_030040E8
	strh r4, [r0]
	ldr r0, _0802157C @ =gUnknown_03003F60
	strh r4, [r0]
	ldr r0, _08021580 @ =gUnknown_03003F3C
	movs r2, #1
	str r2, [r0]
	ldr r1, _08021584 @ =gUnknown_030032D8
	movs r0, #5
	strh r0, [r1]
	ldr r0, _08021588 @ =gUnknown_03003334
	strh r4, [r0]
	ldr r0, _0802158C @ =gUnknown_030033EC
	strh r4, [r0]
	ldr r0, _08021590 @ =gUnknown_03004080
	strh r2, [r0]
	ldr r0, _08021594 @ =gUnknown_030030F8
	strb r5, [r0]
	bl sub_08025E74
	bl sub_0803DE68
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021564: .4byte gUnknown_030033E4
_08021568: .4byte gUnknown_030033E0
_0802156C: .4byte gUnknown_030040F0
_08021570: .4byte gUnknown_030044A0
_08021574: .4byte gUnknown_030040E4
_08021578: .4byte gUnknown_030040E8
_0802157C: .4byte gUnknown_03003F60
_08021580: .4byte gUnknown_03003F3C
_08021584: .4byte gUnknown_030032D8
_08021588: .4byte gUnknown_03003334
_0802158C: .4byte gUnknown_030033EC
_08021590: .4byte gUnknown_03004080
_08021594: .4byte gUnknown_030030F8

