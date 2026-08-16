	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080697CC
sub_080697CC: @ 0x080697CC
	push {r4, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r4, _08069834 @ =gUnknown_08580E60
	ldr r1, [r4]
	ldr r2, _08069838 @ =0x01000400
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0806983C @ =gUnknown_08184FF4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl sub_08011CAC
	ldr r0, _08069840 @ =gUnknown_08185F0C
	ldr r1, _08069844 @ =0x0600C000
	bl sub_08011CAC
	ldr r0, _08069848 @ =gUnknown_081866D8
	movs r1, #0xc0
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0806984C @ =gUnknown_0818616C
	ldr r1, _08069850 @ =gUnknown_0849957C
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _08069854 @ =gUnknown_0818633C
	ldr r1, _08069858 @ =gUnknown_08499580
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _0806985C @ =gUnknown_08186460
	ldr r1, [r4]
	bl sub_08011CAC
	bl sub_08013AFC
	bl sub_08013B0C
	ldr r0, [r4]
	ldr r1, _08069860 @ =0x0600F000
	movs r2, #0x80
	lsls r2, r2, #5
	bl sub_08011E54
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069834: .4byte gUnknown_08580E60
_08069838: .4byte 0x01000400
_0806983C: .4byte gUnknown_08184FF4
_08069840: .4byte gUnknown_08185F0C
_08069844: .4byte 0x0600C000
_08069848: .4byte gUnknown_081866D8
_0806984C: .4byte gUnknown_0818616C
_08069850: .4byte gUnknown_0849957C
_08069854: .4byte gUnknown_0818633C
_08069858: .4byte gUnknown_08499580
_0806985C: .4byte gUnknown_08186460
_08069860: .4byte 0x0600F000

