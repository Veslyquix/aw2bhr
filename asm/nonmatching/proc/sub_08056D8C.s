	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08056D8C
sub_08056D8C: @ 0x08056D8C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r7, r5, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r1, #0x15
	bne _08056E12
	cmp r2, #1
	bne _08056E12
	ldr r0, _08056DD0 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r5, r0
	bne _08056DE4
	ldr r0, _08056DD4 @ =gUnknown_02029BA8
	lsls r2, r5, #5
	adds r0, #0x10
	adds r2, r2, r0
	ldr r4, _08056DD8 @ =gUnknown_08557914
	ldr r3, _08056DDC @ =gUnknown_08553858
	ldr r0, _08056DE0 @ =gUnknown_03004580
	lsls r1, r5, #4
	adds r0, #0xa
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r2]
	b _08056E12
	.align 2, 0
_08056DD0: .4byte gUnknown_0300450C
_08056DD4: .4byte gUnknown_02029BA8
_08056DD8: .4byte gUnknown_08557914
_08056DDC: .4byte gUnknown_08553858
_08056DE0: .4byte gUnknown_03004580
_08056DE4:
	ldr r0, _08056E18 @ =gUnknown_02029BA8
	lsls r4, r7, #5
	adds r0, #0x10
	adds r4, r4, r0
	ldr r6, _08056E1C @ =gUnknown_08557914
	ldr r5, _08056E20 @ =gUnknown_08553858
	ldr r3, _08056E24 @ =gUnknown_03004580
	lsls r1, r7, #4
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldrh r2, [r0]
	adds r2, r2, r5
	adds r1, r1, r3
	ldrh r1, [r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldrb r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4]
_08056E12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056E18: .4byte gUnknown_02029BA8
_08056E1C: .4byte gUnknown_08557914
_08056E20: .4byte gUnknown_08553858
_08056E24: .4byte gUnknown_03004580

