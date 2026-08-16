	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080228D8
sub_080228D8: @ 0x080228D8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	cmp r0, #7
	bgt _080228F8
	ldr r1, _08022930 @ =gUnknown_0809181C
	lsls r0, r0, #7
	adds r0, r0, r1
	ldr r1, _08022934 @ =0x06003600
	movs r2, #0x80
	bl sub_08011E54
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
_080228F8:
	ldr r2, _08022938 @ =gUnknown_03001470
	ldr r0, _0802293C @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r1, #0x1e
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08022948
	ldr r0, _08022940 @ =gUnknown_03004008
	ldr r0, [r0]
	lsrs r0, r0, #2
	movs r1, #0xf
	bl __umodsi3
	lsls r0, r0, #1
	ldr r1, _08022944 @ =gUnknown_08091C9E
	adds r0, r0, r1
	movs r1, #0x81
	lsls r1, r1, #1
	movs r2, #0x1e
	bl sub_08013664
	b _08022964
	.align 2, 0
_08022930: .4byte gUnknown_0809181C
_08022934: .4byte 0x06003600
_08022938: .4byte gUnknown_03001470
_0802293C: .4byte gUnknown_03001FBC
_08022940: .4byte gUnknown_03004008
_08022944: .4byte gUnknown_08091C9E
_08022948:
	ldr r0, _0802296C @ =gUnknown_03004008
	ldr r0, [r0]
	lsrs r0, r0, #2
	movs r1, #0xf
	bl __umodsi3
	lsls r0, r0, #1
	ldr r1, _08022970 @ =gUnknown_08091C5E
	adds r0, r0, r1
	movs r1, #0x81
	lsls r1, r1, #1
	movs r2, #0x1e
	bl sub_08013664
_08022964:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802296C: .4byte gUnknown_03004008
_08022970: .4byte gUnknown_08091C5E

